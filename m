From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 26 Feb 2007 23:25:10 +0000
Subject: [KJ] getting rid of "decl_subsys_name" macro?
Message-Id: <Pine.LNX.4.64.0702261819040.28173@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  just stumbled across the following -- the header file kobject.h
defines two macros for declaring sysfs subsystems:

#define decl_subsys(_name,_type,_uevent_ops) \
struct subsystem _name##_subsys = { \
        .kset = { \
                .kobj = { .name = __stringify(_name) }, \
                .ktype = _type, \
                .uevent_ops =_uevent_ops, \
        } \
}
#define decl_subsys_name(_varname,_name,_type,_uevent_ops) \
struct subsystem _varname##_subsys = { \
        .kset = { \
                .kobj = { .name = __stringify(_name) }, \
                .ktype = _type, \
                .uevent_ops =_uevent_ops, \
        } \
}

  note that the first makes more logical sense as the name of the
structure will match the name of the kobject, while the second allows
those two things to have *different* values.

  but a search of the entire tree turns up exactly *one* instance
where that second variation is being used:

$ grep -rw decl_subsys_name *
drivers/pci/hotplug/pci_hotplug_core.c:decl_subsys_name(pci_hotplug_slots,
   slots, &hotplug_slot_ktype, NULL);

  is it really worth defining an entirely new macro whose semantics
are potentially confusing for the sake of a single kernel-wide
subsystem?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
