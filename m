From: Jim Nelson <james4765@verizon.net>
Date: Thu, 28 Oct 2004 15:25:26 +0000
Subject: Re: [KJ] [PATCH 7/9] to arch/sparc/Kconfig
Message-Id: <41810F66.90308@verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77054115222338471=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041028150029.2776.69333.50087@localhost.localdomain> <20041028150111.2776.47585.86377@localhost.localdomain> <20041028151336.GA10769@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20041028151336.GA10769@parcelfarce.linux.theplanet.co.uk>
To: Matthew Wilcox <matthew@wil.cx>
Cc: kernel-janitors@lists.osdl.org, rusty@rustcorp.com.au, linux-kernel@vger.kernel.org

--===============77054115222338471==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Matthew Wilcox wrote:
> On Thu, Oct 28, 2004 at 10:01:12AM -0500, james4765@verizon.net wrote:
> 
>>Description: Add default for SUN4 in arch/sparc/Kconfig.
>>Apply against 2.6.9.
> 
> 
> The default is already "no".  This patch seems pointless.
> 

Err, you're right.  Unless it is better to have a default on all configuration items.

That'd fix the "# THIS_OPTION is not set" notes in .config, but that's a bit of 
heavy lifting, going through all of the Kconfig files.

Opinions?

--===============77054115222338471==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77054115222338471==--
