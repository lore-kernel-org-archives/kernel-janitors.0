From: Jim Nelson <james4765@verizon.net>
Date: Wed, 08 Dec 2004 22:15:26 +0000
Subject: Re: [KJ] patches: delete 75 unused files
Message-Id: <41B77CFE.9010302@verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66279466189343816=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041208155439.GC31550@nd47.coderock.org>
In-Reply-To: <20041208155439.GC31550@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============66279466189343816==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Gustavo Franco wrote:
> On Wed, 2004-12-08 at 09:13 -0800, Greg KH wrote:
> 
>>On Wed, Dec 08, 2004 at 03:05:20PM -0200, Gustavo Franco wrote:
>>
>>>On Wed, 2004-12-08 at 08:08 -0800, Greg KH wrote:
>>>
>>>>On Wed, Dec 08, 2004 at 04:54:39PM +0100, Domen Puncer wrote:
>>>>
>>>>> drivers/pci/hotplug/pcihp_skeleton.c
>>>>
>>>>This is a "skeleton" driver, and is in the tree to be used as an example
>>>>for others who want to write a pci hotplug driver.  It should stay.
>>>>
>>>>Along those lines, how come you didn't include the usb-skeleton.c file
>>>>in your list (it too should stay, but it isn't part of the build...)?
>>>>
>>>
>>>Why these drivers are under the build tree and not in Documentation/
>>>directory?
>>
>>Because people don't expect to see source code in the Documentation/
>>directory :)
>>
>>I don't really know, that's just the way these types of files have
>>always been (look at drivers/net/pci-skeleton.c and
>>drivers/net/isa-skeleton.c as where I got the idea to write
>>usb-skeleton.c and pcihp_skeleton.c from.)
> 
> 
> Yes, i see more skel stuff inside the tree and i think that it needs
> some discussion or at least don't use skeleton as part of a file name
> that will be compiled. AFAIK, we've some of them sitting at
> arch/m68k/..., but i can't check atm. What do you think?
> 
> --
> Gustavo Franco -- <stratus@acm.org>
> 
>


Why not make a Documentation/driver-skeletons.txt?  I can write it, if everyone 
can point me in the direction of where all the skeleton and example files are.

Jim


--===============66279466189343816==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66279466189343816==--
