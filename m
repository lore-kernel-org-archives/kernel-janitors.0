From: Jim Nelson <james4765@cwazy.co.uk>
Date: Sun, 16 Jan 2005 22:33:28 +0000
Subject: [KJ] Re: [PATCH 0/13] remove cli()/sti() in drivers/char/*
Message-Id: <41EAEBB8.6040900@cwazy.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8288932624299814=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050116135223.30109.26479.55757@localhost.localdomain>	 <20050116130452.10fabe52.akpm@osdl.org> <1105908079.12201.6.camel@localhost.localdomain>
In-Reply-To: <1105908079.12201.6.camel@localhost.localdomain>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@lists.osdl.org

--===============8288932624299814==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Alan Cox wrote:
> On Sul, 2005-01-16 at 21:04, Andrew Morton wrote:
> 
>>James Nelson <james4765@cwazy.co.uk> wrote:
>>
>>>This series of patches removes the last cli()/sti()/save_flags()/restore_flags()
>>> function calls in drivers/char.
>>
>>I don't see much point in this, really.  Those cli() calls are a big fat
>>sign saying "broken on smp" and they now generate compile-time warnings
>>emphasising that.  These drivers still need to be fixed up - we may las
>>well leave them as-is until someone gets onto doing that.
> 
> 
> Please drop all the serial ones. I'm slowly working through the serial
> drivers that are relevant to any kind of users and fixing them up or
> importing fixes from vendor branches as appropriate.
> 
> Simple substitions don't work here, and in some cases even simple tty
> device locks because many cards are chip level interfaces not port
> level.
> 
> Alan
> 
>

Right.  Please disregard this set of patches - I think I'm done flogging this 
directory for awhile :)

--===============8288932624299814==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8288932624299814==--
