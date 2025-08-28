-- Read from EFSA_CURATED_DATA_v20250616.db
SELECT 
  o.ObjectId,
  o.Longitude,
  o.Latitude,
  o.PhenoStageCode ,
  o.ObservationDate 
FROM
    OBSERVATIONS o 
  INNER JOIN 
    MAP_OBSERVATION_10KMGRID mok ON O.ObjectId =MOK.ObjectId
  INNER JOIN
    GRID10KM gk on mok.IdGrid = gk.IDGRID
WHERE
  o.CropTypeCode ='BARS' and
  o.PhenoStageCode in ('00','09','65','89', '99') and
  gk.GAES =1784
order by
  o.objectid
;
