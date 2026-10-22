# WTA - Website To App

سكربت bash بسيط يحوّل أي موقع ويب إلى تطبيق مستقل على سطح المكتب في لينكس، مع أيقونة -قابلة للتخصيص- تظهر في قائمة التطبيقات

## المتطلبات

- curl
- imagemagick
- chromium (يشتغل أيضًا على Brave أو Chrome أو Vivaldi المهم يدعم --app)

## تثبيت المتطلبات:

على Arch

```
sudo pacman -S curl imagemagick chromium
```

على fedora

```
sudo dnf install curl ImageMagick chromium
```

على debian

```
sudo apt install curl imagemagick chromium
```

## التثبيت

```bash
git clone https://github.com/0xdya/wta.git
cd wta
chmod +x install.sh
./install.sh
```

## الاستخدام الافتراضي

```bash
wta youtube youtube.com
```

## الاستخدام مع تخصيص الأيقونة
(رابط صورة أو مسارها إذا لم تحدده، السكربت سيجلب أيقونة الموقع بنفسه إذا كان ممكن)

```bash
wta ملاحظاتي https://notion.so ~/Pictures/notion.png
```

## الاستخدام مع متصفح آخر

```bash
WTA_BROWSER=brave wta github github.com
```

## حذف تطبيق

```
wta -r youtube
```

## حذف المشروع كامل

```
./uninstall.sh
```

الأمر الأول يحذف تطبيقًا أنشأته، والثاني يزيل الأداة (احذف تطبيقاتك أولًا قبل إزالة الأداة)