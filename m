From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Dec 2015 12:08:57 +0000
Subject: Source code review around jump label usage
Message-Id: <566ABCD9.1060404@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, "Derek M. Jones" <derek@knosof.co.uk>

Hello,

I have tried another specific analysis out on the source files
of "Linux next-20151211" with help of the software "Coccinelle 1.0.4".
I have taken a more detailed look on the use of the goto statement
and corresponding jump labels.

Can statistics like the following support software evolution
and further constructive considerations?

╔═════════════════════════════════════════╤═══════════╗
║                 target                  │ incidence ║
╠═════════════════════════════════════════╪═══════════╣
║ out                                     │      9782 ║
║ done                                    │      1344 ║
║ exit                                    │       950 ║
║ out_unlock                              │       538 ║
║ unlock                                  │       509 ║
║ bail                                    │       486 ║
║ error                                   │       418 ║
║ retry                                   │       414 ║
║ err                                     │       400 ║
║ end                                     │       332 ║
║                 …                       │     …     ║
║ abts_pending                            │         1 ║
║ abts_err                                │         1 ║
║ absolute_address                        │         1 ║
║ abort2                                  │         1 ║
║ abort_fail                              │         1 ║
║ abort_end                               │         1 ║
║ abituguru_probe_error                   │         1 ║
║ abituguru_detect_no_pwms_exit           │         1 ║
║ abituguru_detect_bank1_sensor_type_exit │         1 ║
╚═════════════════════════════════════════╧═══════════╝


How often are different jump targets used within function implementations?
(Functions without jump labels were not searched for this analysis approach.)

╔═════════╤═══════════╗
║ counter │ incidence ║
╠═════════╪═══════════╣
║       1 │     18442 ║
║       2 │      2002 ║
║       3 │       356 ║
║       4 │       106 ║
║       5 │        31 ║
║       6 │         7 ║
║       7 │         2 ║
║       8 │         3 ║
╚═════════╧═══════════╝


How does the text length distribution look like for the used jump targets?

╔════════╤═══════════╗
║ length │ incidence ║
╠════════╪═══════════╣
║      1 │         2 ║
║      2 │        29 ║
║      3 │     10640 ║
║      4 │      3564 ║
║      5 │      1714 ║
║      6 │      1162 ║
║      7 │      1245 ║
║      8 │       881 ║
║      9 │       787 ║
║     10 │      1252 ║
║   …    │     …     ║
║     35 │         4 ║
║     36 │         1 ║
║     37 │         2 ║
║     38 │         1 ║
║     39 │         1 ║
╚════════╧═══════════╝


How often are jump targets called within specific function implementations?

╔══════════════════════════╤═════════════════════════════════════════╤══════╤══════════════════════╤═════════╗
║         function         │          source file                    │ line │      go to           │ counter ║
╠══════════════════════════╪═════════════════════════════════════════╪══════╪══════════════════════╪═════════╣
║ do_ipv6_setsockopt       │ net/ipv6/ipv6_sockglue.c                │  140 │ e_inval              │      52 ║
║ dvb_register             │ drivers/media/pci/cx88/cx88-dvb.c       │ 1005 │ frontend_detach      │      43 ║
║ dvb_init                 │ drivers/media/pci/saa7134/saa7134-dvb.c │ 1210 │ detach_frontend      │      40 ║
║ gdbstub_single_step      │ arch/mn10300/kernel/gdb-stub.c          │  491 │ fault                │      38 ║
║ uinput_ioctl_handler     │ drivers/input/misc/uinput.c             │  701 │ out                  │      32 ║
║         …                │               …                         │  …   │        …             │    …    ║
║ kvm_vm_compat_ioctl      │ virt/kvm/kvm_main.c                     │ 2916 │ out                  │       1 ║
║ kvm_vm_ioctl             │ virt/kvm/kvm_main.c                     │ 2742 │ out_free_irq_routing │       1 ║
║ kvm_vm_ioctl_create_vcpu │ virt/kvm/kvm_main.c                     │ 2257 │ vcpu_destroy         │       1 ║
╚══════════════════════════╧═════════════════════════════════════════╧══════╧══════════════════════╧═════════╝


Do any of these numbers indicate update candidates which correspond to the
"one error jump label bug" symptom that is mentioned in the Linux coding
style documentation?

Regards,
Markus
