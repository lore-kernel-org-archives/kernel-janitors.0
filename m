From: Henne <henne@nachtwindheim.de>
Date: Wed, 26 Apr 2006 20:18:54 +0000
Subject: [KJ] This was the last of my pci __devinitdata patches!
Message-Id: <444FD5AE.6050101@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

So, this was the first set of my patches. :)
Things I learned:
-	The default linelength of thunderbird (72 chars) are not enough for patches and configuring the mailclient can save a lot of time.

-	There are many pci-drivers which are not conform in all points to
	<kernel>/Documentation/pci.txt
  	e.g. : if the remove funcion of the driver is marked as __devexit,
		the __devexit_p() is forgotten in struct pci_driver,
		which can leave a pointer to a function which doesn't exist. (evil)

-	Bringing more ifdefs into the kernel is evil too.

-	Typing 286 (what a number) times "__devinitdata" could have benn much more boring.

Questions I have:

-	What is the prefered way to make powemanagement-stuff depend on CONFIG_PM?
	ifdef the .suspend and .resume in struct pci_driver and gather these functions into ONE
	#ifdef CONFIG_PM
	#endif
	?
	There are lots of drivers who have there PM-functions compiled, even if no CONFIG_PM is set.

-	Will these patches be put into the mainline-kernel by you or must every janitor send them
	again to the subsys-maintainer?

Greets,
Henne
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
