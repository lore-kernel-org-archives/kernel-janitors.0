From: Rahul Ruikar <rahul.ruikar@gmail.com>
Date: Wed, 22 Sep 2010 16:47:44 +0000
Subject: Re: kernel compilation error linux-2.6.35.5
Message-Id: <AANLkTi=asYDC4o7-d8v36OGJuSU-+ar-_BSxz17zWLyy@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTini3-so-=GNdVZiLA9XXLfunosGgAtMB_iC67q-@mail.gmail.com>
In-Reply-To: <AANLkTini3-so-=GNdVZiLA9XXLfunosGgAtMB_iC67q-@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Adam,

I Followed this link
http://www.cyberciti.biz/tips/compiling-linux-kernel-26.html

in Summary

make menuconfig   ( here I enabled many option included debug related )
make
make modules_install ( with root )
make install  ( with root )

while compilation of other kernels these 4 steps worked for me.
Am i missing something in compilation process...
and yes important thing.... can we see compilation logs / error logs
??? if yes then please help me to locate this one..


- Rahul Ruikar





On 22 September 2010 21:57, Adam M. Dutko <dutko.adam@gmail.com> wrote:
> Seems you didn't compile the code into the kernel and selected them as
> modules. =A0I'm not familiar with the install.sh script. =A0I usually do =
a lot
> by hand. =A0Did you regenerate your ramdisk?
>
> On Wed, Sep 22, 2010 at 12:09 PM, Rahul Ruikar <rahul.ruikar@gmail.com>
> wrote:
>>
>> Hi All,
>>
>> I compiled kernel 2.6.35.5 on Fedora 13 ( laptop ) i got following error=
s.
>> After completing installation I boot up system with this kernel but
>> sound is not working ..that is
>>
>> [root@Ganesha linux-2.6.35.5]# make install
>> sh /home/rahul/Downloads/stable/linux-2.6.35.5/arch/x86/boot/install.sh
>> 2.6.35.5 arch/x86/boot/bzImage \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0System.map "/boot"
>> ERROR: modinfo: could not find module snd_hda_codec_idt
>> ERROR: modinfo: could not find module snd_hda_intel
>> ERROR: modinfo: could not find module snd_hda_codec
>> ERROR: modinfo: could not find module snd_hwdep
>> ERROR: modinfo: could not find module snd_seq
>> ERROR: modinfo: could not find module snd_seq_device
>> ERROR: modinfo: could not find module snd_pcm
>> ERROR: modinfo: could not find module snd_timer
>> ERROR: modinfo: could not find module snd
>> ERROR: modinfo: could not find module soundcore
>> ERROR: modinfo: could not find module snd_page_alloc
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitor=
s"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
