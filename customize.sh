#!/system/bin/sh

chmod 775 customize.sh

chmod 775 /system/etc/hosts


on_install() {
ui_print "приветик"
ui_print " Ставлю новый hosts"
    
    
    if [ -f "/system/etc/hosts" ]; then
        cp /system/etc/hosts /system/etc/hosts.bak
ui_print "Сделал бэкап старого hosts"
    fi
    
    
    cp -f $TMPDIR/system/etc/hosts /system/etc/hosts
    chmod 644 /system/etc/hosts
    
ui_print "Готово!"
}


on_uninstall() {
ui_print "здрасьте снова"
ui_print " Убираю свой hosts"
    
    
    if [ -f "/system/etc/hosts.bak" ]; then
        cp /system/etc/hosts.bak /system/etc/hosts
        rm /system/etc/hosts.bak
ui_print "Вернул старый hosts на место"
    else
ui_print "Бэкапа нет, просто удаляю свой файл"
        rm -f /system/etc/hosts
    fi
    
ui_print "Все откатил"
}

# Главная хуйня
case "$1" in
    install)
        on_install
        ;;
    uninstall) 
        on_uninstall
        ;;
esac