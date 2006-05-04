From: Henne <henne@nachtwindheim.de>
Date: Thu, 04 May 2006 09:27:30 +0000
Subject: Re: [KJ] 720KB Floppy on 64bit Linux
Message-Id: <4459C902.8090409@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4457C938.1070601@nachtwindheim.de>
In-Reply-To: <4457C938.1070601@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Randy.Dunlap wrote:
>> Henne wrote:
>>> Mounting it Kernel says:
>>> FAT: invalid media value (0x44)
>>> VFS: Can't find a valid FAT filesystem on dev fd0
>> I found out something interesting:
>> I made an image of my old disk with dd and here's the hexdump of the bootsector:
>>
>> 00000000  eb 3c 90 4d 53 44 4f 53  35 2e 90 6e 02 02 7f cf  |.<.MSDOS5..n....|
>> 00000010  eb 3c 90 4d 53 44 4f 53  35 2e 30 00 02 02 01 00  |.<.MSDOS5.0.....|
>> 00000020  02 70 00 a0 05 f9 03 00  09 00 02 00 00 00 00 00  |.p..............|
>> 00000030  00 00 00 00 00 00 29 dc  1c 2c 02 00 53 41 00 00  |......)..,..SA..|
>>
>> You may notice, that the media invalid media value (0x44) is that from offset 0x15.
> 
> Yes, but part of that line looks wrong (like duplicated from above).
> Suspicious.
> 
>> But on the disk image the correct value is on offset 0x25 (the 0xf9), so struct fat_boot_sector
>> must start on 0x10 to work correctly.
> 
> Yes, looks weird.
> 
>> IN THIS CASE!
>>
>> "Normal" 1.44MB FAT disks have a bootsector like this one:
>>
>> 00000000  eb 3c 90 4d 53 44 4f 53  35 33 79 00 02 01 01 00  |.<.MSDOS53y.....|
>> 00000010  02 e0 00 40 0b f0 09 00  12 00 02 00 00 00 00 00  |...@............|
>> 00000020  00 00 00 00 00 00 29 45  49 53 41 53 59 53 52 4f  |......)EISASYSRO|
>> 00000030  4d 35 20 20 20 20 46 41  54 31 32 20 20 20 fa 33  |M5    FAT12   .3|
>>
>> So there everything is allright!
>>
>> But why everything works under i386 and not under x86_64?
> 
> I tested on x86_64 with no problems.  Formatted a 720 KB floppy
> and a 1.4 MB floppy using both mkdosfs and kfloppy, mounted and
> read them both fine.

But I don't understand why a slackware10.2/2.6.17-rc3(selfcompiled) got it,
and Suse10.0_64/2.6.17-rc3(selfcompiled) got it not.
I have also FREEDOS on my i386 which got it too. Strange..
The disks are 3.5 inch with no hole on the left side, are purchased by EBay and seem to be original.
They are from the game "Das schwarze Auge-Schicksalsklinge" which is the german original of "Realms of arkania-Blade of destiny".
And if the work under FREEDOS and i386 I can't belive that the disks are broken.
Nevertheless it is not critical for me, since I got the files from my i386 and moved it to my x86_64.
It's nice to see how you can bypass the install routine with open-source tools and a little knowledge how to use them :) .

But the main question is: Why does it not work?
Can you send the first 5 lines of the disks you formatted, please?
And also try to format a 1.44 disk to 720.

Greets,
Henne
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
