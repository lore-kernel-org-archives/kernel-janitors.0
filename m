From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Fri, 04 Mar 2005 13:05:25 +0000
Subject: [KJ] compile warnings due to change of pci resource element type
Message-Id: <42287935.30573.366952@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10810059765421398=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============10810059765421398==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Trying to comple the latest version (2.6.11-rc5-mm1) gives a huge amount 
of warnings in a lot of files due to printf formats (and a couple of 
other minor issues) that have %lx instead of %llx for the "start" element 
in the pci_resource struct whose type was changed from u32 to u64.

These are relatively easy to fix and need to be fixed because of 
potential stack issues with var arg functions like printk and friends.

My question is: should I do this or is someone else working on this, 
perhaps a better fix than simply changing the majority of occurrences of 
"%lx" to "%llx"?


--===============10810059765421398==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10810059765421398==--
