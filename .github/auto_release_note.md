這是定期自動產生的版本（Release），如果發現問題請提交 Issue，並暫時前往 [此處](https://github.com/ezn24/immich-geodata-zh_TW/releases) 選擇手動發布的版本檔案。

如果遇到 Immich 沒有更新資料，請手動修改 geodata-date.txt 檔案，將其內容中的時間修改為更新的時間（例如：目前時間）。

**BETA** 提供了多種地名顯示層級，可根據需求選擇對應的檔案。

> [!IMPORTANT]
> 每個版本中的更新時間皆相同，這意味著若更換同一個版本中的不同版本檔案，Immich 將無法偵測到資料更新。
>
> 因此，若想嘗試同個版本下不同的資料檔案，請手動調整解壓縮後的 geodata-date.txt 檔案，將其內容中的時間修改為較晚的時間（例如：目前時間），並在 Immich 啟動時觀察是否有 `10000 geodata records imported` 記錄出現，藉此確認是否成功更新資料檔案。

以 `中國,江蘇省,蘇州市,昆山市,周市鎮` 為例

| 範例 | 對應檔案 | 資料增強<br>資料更多、定位更準但編碼較慢 |
| :--- | :--- | :--- |
| 蘇州市 | geodata.zip<br>geodata_admin_2.zip | geodata_full.zip<br>geodata_admin_2_full.zip |
| 昆山市 | geodata_admin_3.zip | geodata_admin_3_full.zip |
| 周市鎮 | geodata_admin_4.zip | geodata_admin_4_full.zip |
| 蘇州市 昆山市 | geodata_admin_2_admin_3.zip | geodata_admin_2_admin_3_full.zip |
| 蘇州市 周市鎮 | geodata_admin_2_admin_4.zip | geodata_admin_2_admin_4_full.zip |
| 昆山市 周市鎮 | geodata_admin_3_admin_4.zip | geodata_admin_3_admin_4_full.zip |
| 蘇州市 昆山市 周市鎮 | geodata_admin_2_admin_3_admin_4.zip | geodata_admin_2_admin_3_admin_4_full.zip |

> [!WARNING]
> 受限於 Immich 本身反向地理編碼原理，在接近邊界時識別效果不佳，而使用層級較低的資料時更容易遇到邊界問題，進而導致識別錯誤，請注意。
>
> 若遇到此情況，可以嘗試使用資料增強版本的資料，或在 [GeoNames](https://www.geonames.org/) 提交相關位置的資料。
