From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Wed, 26 Apr 2006 21:03:35 +0000
Subject: Re: [KJ] This was the last of my pci __devinitdata patches!
Message-Id: <20060426140335.0825a09f.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79634636353443833=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <444FD5AE.6050101@nachtwindheim.de>
In-Reply-To: <444FD5AE.6050101@nachtwindheim.de>
To: kernel-janitors@vger.kernel.org

--===============79634636353443833==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Apr 2006 22:18:54 +0200 Henne wrote:

> So, this was the first set of my patches. :)
> Things I learned:
> -	The default linelength of thunderbird (72 chars) are not enough for patches and configuring the mailclient can save a lot of time.

Uh, yes, that's well-known.  :(
I have written email about how I can use tbird successfully, or
you can try this web page, although our recommendations are different:

http://mbligh.org/linuxdocs/Email/Clients/Thunderbird

> -	There are many pci-drivers which are not conform in all points to
> 	<kernel>/Documentation/pci.txt
>   	e.g. : if the remove funcion of the driver is marked as __devexit,
> 		the __devexit_p() is forgotten in struct pci_driver,
> 		which can leave a pointer to a function which doesn't exist. (evil)

Make a .config file with CONFIG_HOTPLUG=n (tricky[1]) and then build
a kernel.  The modpost phase will check/catch/warn about these.
I have sent patches for quite a few of them recently.


> -	Bringing more ifdefs into the kernel is evil too.
> 
> -	Typing 286 (what a number) times "__devinitdata" could have benn much more boring.


---
~Randy

--===============79634636353443833==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79634636353443833==--
