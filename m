From: Saket Sinha <saket.sinha89@gmail.com>
Date: Tue, 09 Dec 2014 21:31:38 +0000
Subject: Re: List my Staging Drivers
Message-Id: <CAK25hWMJJJ_ChunXcZEgbuo1EHQEPF+dWnp5CwXtxcz7=1QZWQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAJyon0tny1BjTUDN3WF=cXAKQ5u6_jHUAfOuW6m7NzLsnxmGvQ@mail.gmail.com>
	<42976981.0zcCP3BMYl@mayhem>
In-Reply-To: <42976981.0zcCP3BMYl@mayhem>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernelnewbies@lists.kernelnewbies.org

Hi Lucas,

Please find my response inline.

> Goal: find drivers that I could start improving ( understand, develop,
> test , submit )
> How : If my machine uses a driver, I can read the code, modify and
> test in my machine
>

Suppose you want to improve/change  a basic driver you are using for
example XFS filesystem.

/lib/modules/<kernel_version>/points to the location of the source code

On my Ubuntu 14.04 machine,

ssinha@ssinha-Latitude-E6440:~$ ls -l /lib/modules/`uname -r`/
total 3852
lrwxrwxrwx  1 root root     40 Sep 23 04:03 build ->
/usr/src/linux-headers-3.13.0-37-generic


so the location of the source code is /usr/src/linux-headers-3.13.0-37-gene=
ric.

Now go to the fs folder here to get the source code of xfs.
ssinha@ssinha-Latitude-E6440:~$ ls -l
/usr/src/linux-headers-3.13.0-37-generic/fs/xfs
total 8
-rw-r--r-- 1 root root 3839 Jan 20  2014 Kconfig
-rw-r--r-- 1 root root 3027 Jan 20  2014 Makefile

Now what I find is that I have only headers not the entire source code.

So the distros don't generally ship with the entire source code. You
can get the source code of your running kernel by either the source
packages(kernel-src-rpms or kernel-src-deb) of the distros or you can
get tar ball of your running kernel from the kernel.org.

> So, if I'm able to see where is located the source for a driver that
> my machine uses, I can modify and test.
>

Now when you have the source code, change the driver, make sure its
enabled in the kernel .config driver, build the entire kernel and boot
into your modified kernel. (If your driver is standalone and not
dependent on other drivers, you can build its seprately and insmod it
without having to build the entire kernel tree.)

Hope that helps.

Regards,
Saket Sinha


On Wed, Dec 10, 2014 at 2:23 AM, Davide Gianforte <davide@gengisdave.org> w=
rote:
> In data marted=C3=AC 9/12/2014 18:45:59, Lucas Tanure ha scritto:
>> Hi,
>>
>> How do I list where are the modules that I'm using inside kernel ?
>>
>> Goal: find drivers that I could start improving ( understand, develop,
>> test , submit )
>> How : If my machine uses a driver, I can read the code, modify and
>> test in my machine
>>
>> So, if I'm able to see where is located the source for a driver that
>> my machine uses, I can modify and test.
>>
>> Ideas ?
>>
>> Thanks
>
> 'lsmod' and 'lspci -k' show your loaded modules and which module is handl=
ing a device.
>
> 'find /lib/modules/$(uname -r)/kernel $module_name' show you where the mo=
dule is located; /lib/modules/<kernel_version>/kernel folder tree is equal =
to the source tree.
>
> Dave
>
> _______________________________________________
> Kernelnewbies mailing list
> Kernelnewbies@kernelnewbies.org
> http://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
