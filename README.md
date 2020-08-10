# Digi Blog Web Api

Digi Blog Web Api, Bir blog inşa etmek için veriye erişim ve işleme yetenekleriyle donatılmış bir apidir. 

## Projenin Veritabanını Sql Scriptlerini Kullanarak Oluşturma
![GitHub Logo](https://i.ibb.co/HdDcwnH/sqlscripts.png)

Proje içerisinde Scripts dizini altında scriptler numaralandırılmış bir şekilde yer almaktadır.Sırasıyla çalıştırılmalıdır.Script çalıştırmadan önce aşağıdaki komut ile veritabanı yok ise oluşturulmalıdır.

```
CREATE DATABASE [DigiturkBlogSystem]
```

## Projenin Veritabanını Entity Framework Komutları İle Oluşturma

Projenin içerisindeki Migrations dizinindeki dosyaları silin.
Yönetici olarak komut satırını açıp proje dizinine gidin. 
Sırasıyla aşağıdaki komutları çalıştırın.
```
dotnet ef migrations add init
```
```
dotnet ef database update
```

## Sorular
```
* Projede kullandığınız tasarım desenleri hangileridir? Bu desenleri neden kullandınız?
```
1.Dependecy Injection
Net Core ile dahili olarak gelen Dependeny Injection tasarım deseninin gerçekleştirimi olan Microsoft Dependeny Injection kullanıldı.Bu tasarım deseni nesneler arasındaki bağı azaltır(loosely coupled code).Nesnelerin test edilebilirliğini kolaylaştırır.
2.Repository,UnitofWork
Repository iş katmanı ile veri katmanı arasına girerek kodumuzu soyutlar.Bu soyutlama sayesinde daha kolay bir şekilde projede kullanılan veriye erişim ve işleme teknolojisini değiştirebiliriz.EF ten NHibernate geçiş gibi.Soyutlamanın yanında objelere erişimi merkezileştirir.
UnitOfWork repository ile kullanılan bir desen.Repo ile objelere erişilip işlem yapılır her işlem sonrası contextde uygulanmasın diye Single Responsibility prensibinden bu sorumluluğu Repoya vermeyip UnitOfWork çıkartılmış diye düşünüyorum.

```
* Kullandığını teknoloji ve kütüphaneler hakkında daha önce tecrübeniz oldu mu? Tek tek yazabilir misiniz?
```
1.Veritabanı
Projede veritabanı teknolojisi olarak EntityFrameworkCore kullandım.Çalışmış olduğum projede veritabanı teknolojisi olarak EntityFramework kullanmaktayım bu projede core versiyonunu denedim.Eagerloading konfigurasyonu bulunmamaktaydı.Entity eriştikten sonra many to many ilişkileri için Include ile navigation prop belirlenmesi gerekiyordu.Repositoryde sırf bunun için metot yazıldı.
2.Log
Süreçleri takip edebilmek adına NLog  kütüphanesini kullandım.Request/Response loglaması için middleware yazılabilir.
```
* Daha geniş vaktiniz olsaydı projeye neler eklemek isterdiniz?
```
Api Monitoring
```
* Eklemek istediğiniz bir yorumunuz var mı?
```

Teşekkür eder.İyi çalışmalar dilerim.




