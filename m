From: Carlo Perassi <carlo@linux.it>
Date: Tue, 09 Aug 2005 14:11:48 +0000
Subject: [KJ] rfc about an uncommented string
Message-Id: <20050809141147.GB4603@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46127443896331366=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============46127443896331366==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

I'd like to collect some comments about the following code
segment I found in
linux-2.6.13-rc6/arch/mips/ite-boards/generic/it8172_setup.c
(the "^^^" sequence is not mine, it's in the code)

#ifdef CONFIG_SERIO_I8042
/*
 * According to the ITE Special BIOS Note for waking up the
 * keyboard controller...
 */
static int init_8712_keyboard(void)
{
	unsigned int cmd_port = 0x14000064;
	unsigned int data_port = 0x14000060;
	                         ^^^^^^^^^^^
	Somebody here doesn't grok the concept of io ports.

-- 
Carlo Perassi - http://www.linux.it/~carlo/

--===============46127443896331366==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46127443896331366==--
