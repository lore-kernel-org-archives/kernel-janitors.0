From: selva <selvabe99@gmail.com>
Date: Fri, 11 Jul 2014 03:18:48 +0000
Subject: External Keyboard not getting detected in custom kernel
Message-Id: <CAJK=4YYfui9KUc36yO0wrt4JU+d5g3pnoT=r=+EaTzATgVFK6g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi

I have built a custom kernel. On loading the kernel my external keyboard
is not detected.  On looking at the kernel log, the logs are reporting kernel
event drop and the below are the logs of kernel & udevmonitor

kernel logs

Jul  9 23:30:38 debian-laptop kernel: [  222.644330] kobject:
'0003:0E6A:6001.0002' (ffff880082c499b8): kobject_uevent_env
Jul  9 23:30:38 debian-laptop kernel: [  222.646690] kobject:
'0003:0E6A:6001.0002' (ffff880082c499b8): fill_kobj_path: path '/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.1/0003:0E6A:6001.0002'
Jul  9 23:30:38 debian-laptop kernel: [  222.651987] kobject:
'0003:0E6A:6001.0002' (ffff880082c499b8): kobject_release, parent
     (null) (delayed 750)
Jul  9 23:30:38 debian-laptop kernel: [  222.658102] kobject:
'1-1:1.1' (ffff88008556f840): kobject_uevent_env
Jul  9 23:30:38 debian-laptop kernel: [  222.659246] kobject:
'1-1:1.1' (ffff88008556f840): fill_kobj_path: path '/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.1'
Jul  9 23:30:38 debian-laptop kernel: [  222.661766] kobject:
'1-1:1.0' (ffff88008556e840): kobject_release, parent           (null)
(delayed 1000)
Jul  9 23:30:38 debian-laptop kernel: [  222.663938] kobject:
'1-1:1.1' (ffff88008556f840): kobject_release, parent           (null)
(delayed 1000)
Jul  9 23:30:38 debian-laptop kernel: [  222.667576] kobject: 'ep_00'
(ffff880084ad0820): kobject_uevent_env
Jul  9 23:30:38 debian-laptop kernel: [  222.668924] kobject: 'ep_00'
(ffff880084ad0820): kobject_uevent_env: filter function caused the
event to drop!
Jul  9 23:30:38 debian-laptop kernel: [  222.671304] kobject: 'ep_00'
(ffff880084ad0820): kobject_release, parent           (null) (delayed
1000)
Jul  9 23:30:38 debian-laptop kernel: [  222.684228] kobject: '1-1'
(ffff88008312f8a0): kobject_uevent_env
Jul  9 23:30:38 debian-laptop kernel: [  222.685471] kobject: '1-1'
(ffff88008312f8a0): fill_kobj_path: path '/devices/pci0000:00/0000:00:1a.0/usb1/1-1'
Jul  9 23:30:38 debian-laptop kernel: [  222.695476] kobject: '1-1'
(ffff88008312f8a0): kobject_release, parent           (null) (delayed
500)
Jul  9 23:30:40 debian-laptop kernel: [  224.620196] kobject: 'ep_81'
(ffff880082fce820): kobject_cleanup, parent           (null)
Jul  9 23:30:40 debian-laptop kernel: [  224.622412] kobject: 'ep_81'
(ffff880082fce820): calling ktype release
Jul  9 23:30:40 debian-laptop kernel: [  224.623584] kobject: 'ep_81': free name
Jul  9 23:30:40 debian-laptop kernel: [  224.644176] kobject: 'ep_82'
(ffff880082ff9820): kobject_cleanup, parent           (null)
Jul  9 23:30:40 debian-laptop kernel: [  224.646374] kobject: 'ep_82'
(ffff880082ff9820): calling ktype release
Jul  9 23:30:40 debian-laptop kernel: [  224.647557] kobject: 'ep_82': free name
Jul  9 23:30:40 debian-laptop kernel: [  224.700313] kobject: '1-1'
(ffff88008312f8a0): kobject_cleanup, parent           (null)
Jul  9 23:30:40 debian-laptop kernel: [  224.702499] kobject: '1-1'
(ffff88008312f8a0): calling ktype release
Jul  9 23:30:40 debian-laptop kernel: [  224.703702] kobject: '1-1': free name
Jul  9 23:30:41 debian-laptop kernel: [  225.656280] kobject:
'0003:0E6A:6001.0002' (ffff880082c499b8): kobject_cleanup, parent
     (null)
Jul  9 23:30:41 debian-laptop kernel: [  225.658501] kobject:
'0003:0E6A:6001.0002' (ffff880082c499b8): calling ktype release
Jul  9 23:30:41 debian-laptop kernel: [  225.661087] kobject:
'0003:0E6A:6001.0002': free name
Jul  9 23:30:42 debian-laptop kernel: [  226.640360] kobject:
'0003:0E6A:6001.0001' (ffff8800b092d9b8): kobject_cleanup, parent
     (null)
Jul  9 23:30:42 debian-laptop kernel: [  226.642571] kobject:
'0003:0E6A:6001.0001' (ffff8800b092d9b8): calling ktype release
Jul  9 23:30:42 debian-laptop kernel: [  226.644989] kobject:
'0003:0E6A:6001.0001': free name
Jul  9 23:30:42 debian-laptop kernel: [  226.672226] kobject:
'1-1:1.0' (ffff88008556e840): kobject_cleanup, parent           (null)
Jul  9 23:30:42 debian-laptop kernel: [  226.674468] kobject:
'1-1:1.0' (ffff88008556e840): calling ktype release
Jul  9 23:30:42 debian-laptop kernel: [  226.675665] kobject:
'1-1:1.0': free name
Jul  9 23:30:42 debian-laptop kernel: [  226.676899] kobject:
'1-1:1.1' (ffff88008556f840): kobject_cleanup, parent           (null)
Jul  9 23:30:42 debian-laptop kernel: [  226.679354] kobject:
'1-1:1.1' (ffff88008556f840): calling ktype release
Jul  9 23:30:42 debian-laptop kernel: [  226.680726] kobject:
'1-1:1.1': free name
Jul  9 23:30:42 debian-laptop kernel: [  226.682173] kobject: 'ep_00'
(ffff880084ad0820): kobject_cleanup, parent           (null)
Jul  9 23:30:42 debian-laptop kernel: [  226.684491] kobject: 'ep_00'
(ffff880084ad0820): calling ktype release
Jul  9 23:30:42 debian-laptop kernel: [  226.685587] kobject: 'ep_00': free name
Jul  9 23:30:52 debian-laptop kernel: [  236.632569] usb 1-1: new
low-speed USB device number 3 using uhci_hcd
Jul  9 23:30:53 debian-laptop kernel: [  236.809523] usb 1-1: New USB
device found, idVendor6a, idProduct`01
Jul  9 23:30:53 debian-laptop kernel: [  236.810628] usb 1-1: New USB
device strings: Mfr=0, Product=1, SerialNumber=0
Jul  9 23:30:53 debian-laptop kernel: [  236.812948] usb 1-1: Product:
HID Keyboard Device
Jul  9 23:30:53 debian-laptop kernel: [  236.814164] kobject: '1-1'
(ffff880058fb38a0): kobject_add_internal: parent: 'usb1', set:
'devices'
Jul  9 23:30:53 debian-laptop kernel: [  236.819907] kobject: '1-1'
(ffff880058fb38a0): kobject_uevent_env
Jul  9 23:30:53 debian-laptop kernel: [  236.821079] kobject: '1-1'
(ffff880058fb38a0): fill_kobj_path: path '/devices/pci0000:00/0000:00:1a.0/usb1/1-1'
Jul  9 23:30:53 debian-laptop kernel: [  236.839632] kobject:
'1-1:1.0' (ffff88008431f840): kobject_add_internal: parent: '1-1',
set: 'devices'
Jul  9 23:30:53 debian-laptop kernel: [  236.854595] kobject:
'1-1:1.0' (ffff88008431f840): kobject_uevent_env
Jul  9 23:30:53 debian-laptop kernel: [  236.855713] kobject:
'1-1:1.0' (ffff88008431f840): fill_kobj_path: path '/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0'
Jul  9 23:30:53 debian-laptop kernel: [  236.873294] kobject:
'0003:0E6A:6001.0004' (ffff880082fc19b8): kobject_add_internal:
parent: '1-1:1.0', set: 'devices'
Jul  9 23:30:53 debian-laptop kernel: [  236.878155] kobject:
'0003:0E6A:6001.0004' (ffff880082fc19b8): kobject_uevent_env
Jul  9 23:30:53 debian-laptop kernel: [  236.880779] kobject:
'0003:0E6A:6001.0004' (ffff880082fc19b8): fill_kobj_path: path '/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0/0003:0E6A:6001.0004'
Jul  9 23:30:53 debian-laptop kernel: [  236.885146] kobject: 'ep_81'
(ffff880037393820): kobject_add_internal: parent: '1-1:1.0', set:
'devices'
Jul  9 23:30:53 debian-laptop kernel: [  236.889926] kobject: 'ep_81'
(ffff880037393820): kobject_uevent_env
Jul  9 23:30:53 debian-laptop kernel: [  236.891060] kobject: 'ep_81'
(ffff880037393820): kobject_uevent_env: filter function caused the
event to drop!
Jul  9 23:30:53 debian-laptop kernel: [  236.893474] kobject:
'1-1:1.1' (ffff880037042840): kobject_add_internal: parent: '1-1',
set: 'devices'
Jul  9 23:30:53 debian-laptop kernel: [  236.907625] kobject:
'1-1:1.1' (ffff880037042840): kobject_uevent_env
Jul  9 23:30:53 debian-laptop kernel: [  236.908768] kobject:
'1-1:1.1' (ffff880037042840): fill_kobj_path: path '/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.1'
Jul  9 23:30:53 debian-laptop kernel: [  236.925027] kobject:
'0003:0E6A:6001.0005' (ffff8800375019b8): kobject_add_internal:
parent: '1-1:1.1', set: 'devices'
Jul  9 23:30:53 debian-laptop kernel: [  236.929385] kobject:
'0003:0E6A:6001.0005' (ffff8800375019b8): kobject_uevent_env
Jul  9 23:30:53 debian-laptop kernel: [  236.931691] kobject:
'0003:0E6A:6001.0005' (ffff8800375019b8): fill_kobj_path: path '/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.1/0003:0E6A:6001.0005'
Jul  9 23:30:53 debian-laptop kernel: [  236.935924] kobject: 'ep_82'
(ffff88008556c820): kobject_add_internal: parent: '1-1:1.1', set:
'devices'
Jul  9 23:30:53 debian-laptop kernel: [  236.939944] kobject: 'ep_82'
(ffff88008556c820): kobject_uevent_env
Jul  9 23:30:53 debian-laptop kernel: [  236.941062] kobject: 'ep_82'
(ffff88008556c820): kobject_uevent_env: filter function caused the
event to drop!
Jul  9 23:30:53 debian-laptop kernel: [  236.943615] kobject: 'ep_00'
(ffff88003a12d820): kobject_add_internal: parent: '1-1', set:
'devices'
Jul  9 23:30:53 debian-laptop kernel: [  236.947118] kobject: 'ep_00'
(ffff88003a12d820): kobject_uevent_env
Jul  9 23:30:53 debian-laptop kernel: [  236.948350] kobject: 'ep_00'
(ffff88003a12d820): kobject_uevent_env: filter function caused the
event to drop!
Jul  9 23:32:07 debian-laptop kernel: [  311.641070] usb 1-1: USB
disconnect, device number 3
Jul  9 23:32:07 debian-laptop kernel: [  311.642876] kobject: 'ep_81'
(ffff880037393820): kobject_uevent_env
Jul  9 23:32:07 debian-laptop kernel: [  311.643974] kobject: 'ep_81'
(ffff880037393820): kobject_uevent_env: filter function caused the
event to drop!
Jul  9 23:32:07 debian-laptop kernel: [  311.646326] kobject: 'ep_81'
(ffff880037393820): kobject_release, parent           (null) (delayed
250)
Jul  9 23:32:07 debian-laptop kernel: [  311.650209] kobject:
'0003:0E6A:6001.0004' (ffff880082fc19b8): kobject_uevent_env
Jul  9 23:32:07 debian-laptop kernel: [  311.653022] kobject:
'0003:0E6A:6001.0004' (ffff880082fc19b8): fill_kobj_path: path '/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0/0003:0E6A:6001.0004'
Jul  9 23:32:07 debian-laptop kernel: [  311.657004] kobject:
'0003:0E6A:6001.0004' (ffff880082fc19b8): kobject_release, parent
     (null) (delayed 750)
Jul  9 23:32:07 debian-laptop kernel: [  311.659375] kobject:
'1-1:1.0' (ffff88008431f840): kobject_uevent_env
Jul  9 23:32:07 debian-laptop kernel: [  311.660755] kobject:
'1-1:1.0' (ffff88008431f840): fill_kobj_path: path '/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0'
Jul  9 23:32:07 debian-laptop kernel: [  311.664253] kobject: 'ep_82'
(ffff88008556c820): kobject_uevent_env
Jul  9 23:32:07 debian-laptop kernel: [  311.665396] kobject: 'ep_82'
(ffff88008556c820): kobject_uevent_env: filter function caused the
event to drop!
Jul  9 23:32:07 debian-laptop kernel: [  311.668221] kobject: 'ep_82'
(ffff88008556c820): kobject_release, parent           (null) (delayed
250)
Jul  9 23:32:07 debian-laptop kernel: [  311.671684] kobject:
'0003:0E6A:6001.0005' (ffff8800375019b8): kobject_uevent_env
Jul  9 23:32:07 debian-laptop kernel: [  311.674423] kobject:
'0003:0E6A:6001.0005' (ffff8800375019b8): fill_kobj_path: path '/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.1/0003:0E6A:6001.0005'
Jul  9 23:32:07 debian-laptop kernel: [  311.678855] kobject:
'0003:0E6A:6001.0005' (ffff8800375019b8): kobject_release, parent
     (null) (delayed 1000)
Jul  9 23:32:07 debian-laptop kernel: [  311.681775] kobject:
'1-1:1.1' (ffff880037042840): kobject_uevent_env
Jul  9 23:32:07 debian-laptop kernel: [  311.682892] kobject:
'1-1:1.1' (ffff880037042840): fill_kobj_path: path '/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.1'
Jul  9 23:32:07 debian-laptop kernel: [  311.685661] kobject:
'1-1:1.0' (ffff88008431f840): kobject_release, parent           (null)
(delayed 500)
Jul  9 23:32:07 debian-laptop kernel: [  311.688149] kobject:
'1-1:1.1' (ffff880037042840): kobject_release, parent           (null)
(delayed 250)
Jul  9 23:32:07 debian-laptop kernel: [  311.691352] kobject: 'ep_00'
(ffff88003a12d820): kobject_uevent_env
Jul  9 23:32:07 debian-laptop kernel: [  311.692677] kobject: 'ep_00'
(ffff88003a12d820): kobject_uevent_env: filter function caused the
event to drop!
Jul  9 23:32:07 debian-laptop kernel: [  311.695243] kobject: 'ep_00'
(ffff88003a12d820): kobject_release, parent           (null) (delayed
750)
Jul  9 23:32:07 debian-laptop kernel: [  311.704626] kobject: '1-1'
(ffff880058fb38a0): kobject_uevent_env
Jul  9 23:32:07 debian-laptop kernel: [  311.705766] kobject: '1-1'
(ffff880058fb38a0): fill_kobj_path: path '/devices/pci0000:00/0000:00:1a.0/usb1/1-1'
Jul  9 23:32:07 debian-laptop kernel: [  311.709408] kobject: '1-1'
(ffff880058fb38a0): kobject_release, parent           (null) (delayed
250)
Jul  9 23:32:08 debian-laptop kernel: [  312.648251] kobject: 'ep_81'
(ffff880037393820): kobject_cleanup, parent           (null)
Jul  9 23:32:08 debian-laptop kernel: [  312.650440] kobject: 'ep_81'
(ffff880037393820): calling ktype release
Jul  9 23:32:08 debian-laptop kernel: [  312.651593] kobject: 'ep_81': free name
Jul  9 23:32:08 debian-laptop kernel: [  312.668241] kobject: 'ep_82'
(ffff88008556c820): kobject_cleanup, parent           (null)
Jul  9 23:32:08 debian-laptop kernel: [  312.670427] kobject: 'ep_82'
(ffff88008556c820): calling ktype release
Jul  9 23:32:08 debian-laptop kernel: [  312.671652] kobject: 'ep_82': free name
Jul  9 23:32:08 debian-laptop kernel: [  312.688264] kobject:
'1-1:1.1' (ffff880037042840): kobject_cleanup, parent           (null)
Jul  9 23:32:08 debian-laptop kernel: [  312.690651] kobject:
'1-1:1.1' (ffff880037042840): calling ktype release
Jul  9 23:32:08 debian-laptop kernel: [  312.691812] kobject:
'1-1:1.1': free name
Jul  9 23:32:08 debian-laptop kernel: [  312.708194] kobject: '1-1'
(ffff880058fb38a0): kobject_cleanup, parent           (null)
Jul  9 23:32:08 debian-laptop kernel: [  312.710350] kobject: '1-1'
(ffff880058fb38a0): calling ktype release
Jul  9 23:32:08 debian-laptop kernel: [  312.711543] kobject: '1-1': free name
Jul  9 23:32:09 debian-laptop kernel: [  313.692277] kobject:
'1-1:1.0' (ffff88008431f840): kobject_cleanup, parent           (null)
Jul  9 23:32:09 debian-laptop kernel: [  313.694467] kobject:
'1-1:1.0' (ffff88008431f840): calling ktype release
Jul  9 23:32:09 debian-laptop kernel: [  313.695660] kobject:
'1-1:1.0': free name
Jul  9 23:32:10 debian-laptop kernel: [  314.664228] kobject:
'0003:0E6A:6001.0004' (ffff880082fc19b8): kobject_cleanup, parent
     (null)
Jul  9 23:32:10 debian-laptop kernel: [  314.666432] kobject:
'0003:0E6A:6001.0004' (ffff880082fc19b8): calling ktype release
Jul  9 23:32:10 debian-laptop kernel: [  314.668856] kobject:
'0003:0E6A:6001.0004': free name
Jul  9 23:32:10 debian-laptop kernel: [  314.704339] kobject: 'ep_00'
(ffff88003a12d820): kobject_cleanup, parent           (null)
Jul  9 23:32:10 debian-laptop kernel: [  314.706534] kobject: 'ep_00'
(ffff88003a12d820): calling ktype release
Jul  9 23:32:10 debian-laptop kernel: [  314.707674] kobject: 'ep_00': free name
Jul  9 23:32:11 debian-laptop kernel: [  315.688324] kobject:
'0003:0E6A:6001.0005' (ffff8800375019b8): kobject_cleanup, parent
     (null)
Jul  9 23:32:11 debian-laptop kernel: [  315.690557] kobject:
'0003:0E6A:6001.0005' (ffff8800375019b8): calling ktype release
Jul  9 23:32:11 debian-laptop kernel: [  315.692967] kobject:
'0003:0E6A:6001.0005': free name
Jul  9 23:41:03 debian-laptop kernel: [  846.811709] perf interrupt
took too long (5010 > 5000), lowering
kernel.perf_event_max_sample_rate to 25000


udevmonitor

KERNEL[236.823742] add      /devices/pci0000:00/0000:00:1a.0/usb1/1-1 (usb)
KERNEL[236.860414] add
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0 (usb)
KERNEL[236.884423] add
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0/0003:0E6A:6001.0004
(hid)
KERNEL[236.911117] add
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.1 (usb)
KERNEL[236.935516] add
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.1/0003:0E6A:6001.0005
(hid)
UDEV  [236.979368] add      /devices/pci0000:00/0000:00:1a.0/usb1/1-1 (usb)
UDEV  [236.998601] add
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0 (usb)
UDEV  [237.014213] add
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0/0003:0E6A:6001.0004
(hid)
UDEV  [237.017205] add
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.1 (usb)
UDEV  [237.025795] add
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.1/0003:0E6A:6001.0005
(hid)
KERNEL[311.656451] remove
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0/0003:0E6A:6001.0004
(hid)
KERNEL[311.663207] remove
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0 (usb)
UDEV  [311.667885] remove
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0/0003:0E6A:6001.0004
(hid)
KERNEL[311.678312] remove
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.1/0003:0E6A:6001.0005
(hid)
KERNEL[311.685410] remove
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.1 (usb)
UDEV  [311.708649] remove
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0 (usb)
KERNEL[311.709169] remove   /devices/pci0000:00/0000:00:1a.0/usb1/1-1 (usb)
UDEV  [311.717873] remove
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.1/0003:0E6A:6001.0005
(hid)
UDEV  [311.721844] remove
/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.1 (usb)
UDEV  [311.725708] remove   /devices/pci0000:00/0000:00:1a.0/usb1/1-1 (usb)


I would like to what configuration should i modify to make my keyboard working

Thanks
Selvaraj
