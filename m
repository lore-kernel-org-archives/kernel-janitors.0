From: Lucas Tanure <tanure@linux.com>
Date: Wed, 10 Dec 2014 00:18:48 +0000
Subject: Re: List my Staging Drivers
Message-Id: <CAJyon0vqHauxYxy0=efGr1Hpk6pE5mQUUTutDj5jMSf6u_Ysgw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAJyon0tny1BjTUDN3WF=cXAKQ5u6_jHUAfOuW6m7NzLsnxmGvQ@mail.gmail.com>
	<42976981.0zcCP3BMYl@mayhem>
	<CAK25hWMJJJ_ChunXcZEgbuo1EHQEPF+dWnp5CwXtxcz7=1QZWQ@mail.gmail.com>
	<CAJyon0u7J7x2+7syeEZUpwNHjemYO14Gp2LELcpm-dkrE3pEmA@mail.gmail.com>
In-Reply-To: <CAJyon0u7J7x2+7syeEZUpwNHjemYO14Gp2LELcpm-dkrE3pEmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernelnewbies@lists.kernelnewbies.org

On Tue, Dec 9, 2014 at 8:42 PM, Lucas Tanure <tanure@linux.com> wrote:
> On Tue, Dec 9, 2014 at 7:19 PM, Saket Sinha <saket.sinha89@gmail.com> wro=
te:
>> Hi Lucas,
>>
>> Please find my response inline.
>>
>>> Goal: find drivers that I could start improving ( understand, develop,
>>> test , submit )
>>> How : If my machine uses a driver, I can read the code, modify and
>>> test in my machine
>>>
>>
>> Suppose you want to improve/change  a basic driver you are using for
>> example XFS filesystem.
>>
>> /lib/modules/<kernel_version>/points to the location of the source code
>>
>> On my Ubuntu 14.04 machine,
>>
>> ssinha@ssinha-Latitude-E6440:~$ ls -l /lib/modules/`uname -r`/
>> total 3852
>> lrwxrwxrwx  1 root root     40 Sep 23 04:03 build ->
>> /usr/src/linux-headers-3.13.0-37-generic
>>
>>
>> so the location of the source code is /usr/src/linux-headers-3.13.0-37-g=
eneric.
>>
>> Now go to the fs folder here to get the source code of xfs.
>> ssinha@ssinha-Latitude-E6440:~$ ls -l
>> /usr/src/linux-headers-3.13.0-37-generic/fs/xfs
>> total 8
>> -rw-r--r-- 1 root root 3839 Jan 20  2014 Kconfig
>> -rw-r--r-- 1 root root 3027 Jan 20  2014 Makefile
>>
>> Now what I find is that I have only headers not the entire source code.
>>
>> So the distros don't generally ship with the entire source code. You
>> can get the source code of your running kernel by either the source
>> packages(kernel-src-rpms or kernel-src-deb) of the distros or you can
>> get tar ball of your running kernel from the kernel.org.
>>
>>> So, if I'm able to see where is located the source for a driver that
>>> my machine uses, I can modify and test.
>>>
>>
>> Now when you have the source code, change the driver, make sure its
>> enabled in the kernel .config driver, build the entire kernel and boot
>> into your modified kernel. (If your driver is standalone and not
>> dependent on other drivers, you can build its seprately and insmod it
>> without having to build the entire kernel tree.)
>>
>> Hope that helps.
>>
>> Regards,
>> Saket Sinha
>>
>>
>> On Wed, Dec 10, 2014 at 2:23 AM, Davide Gianforte <davide@gengisdave.org=
> wrote:
>>> In data marted=C3=AC 9/12/2014 18:45:59, Lucas Tanure ha scritto:
>>>> Hi,
>>>>
>>>> How do I list where are the modules that I'm using inside kernel ?
>>>>
>>>> Goal: find drivers that I could start improving ( understand, develop,
>>>> test , submit )
>>>> How : If my machine uses a driver, I can read the code, modify and
>>>> test in my machine
>>>>
>>>> So, if I'm able to see where is located the source for a driver that
>>>> my machine uses, I can modify and test.
>>>>
>>>> Ideas ?
>>>>
>>>> Thanks
>>>
>>> 'lsmod' and 'lspci -k' show your loaded modules and which module is han=
dling a device.
>>>
>>> 'find /lib/modules/$(uname -r)/kernel $module_name' show you where the =
module is located; /lib/modules/<kernel_version>/kernel folder tree is equa=
l to the source tree.
>>>
>>> Dave
>>>
>>> _______________________________________________
>>> Kernelnewbies mailing list
>>> Kernelnewbies@kernelnewbies.org
>>> http://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies
>
> Hi,
>
> Thanks for the reply. But, actually, I found one solution, just like
> what Davide explained.
>
> tanure@archDesk  ~ $ modinfo ehci_hcd
> filename:
> /lib/modules/3.18.0-next-20141209-ARCH/kernel/drivers/usb/host/ehci-hcd.ko
> license:        GPL
> author:         David Brownell
> description:    USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> depends:        usbcore
> intree:         Y
> vermagic:       3.18.0-next-20141209-ARCH SMP preempt mod_unload modversi=
ons
> parm:           log2_irq_thresh:log2 IRQ latency, 1-64 microframes (int)
> parm:           park:park setting; 1-3 back-to-back async packets (uint)
> parm:           ignore_oc:ignore bogus hardware overcurrent indications (=
bool)
>
> With modinfo I can locate the path "drivers/usb/host/ehci-hcd.ko" and
> this is my /workspace/linux-next/drivers/usb/host/ehci*.
> This is similar what you guys talked.
>
> Many thanks guys
>
> --
> Lucas Tanure
> +55 (19) 988176559

Hi,

This command:

$ lsmod  | grep -Eo '^[^ ]+' | sed 1d | xargs modinfo | grep filename

Shows me where is the code that I'm using. So, I can start with these
source codes.

Thanks

--
Lucas Tanure
+55 (19) 988176559
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
