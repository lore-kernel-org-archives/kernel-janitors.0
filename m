From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 10 Jan 2013 17:12:43 +0000
Subject: Q: generic module{init,exit} boilerplate
Message-Id: <ADE657CA350FB648AAC2C43247A983F00207A6CBA7AB@AUSP01VMBX24.collaborationhost.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello all,

There are a number of drivers/modules in the kernel that have
a "do nothing" module init/exit of the form:

static int __init foo_init(void)
{
	return 0;
}
module_init(foo_init);

static void __exit foo_exit(void)
{
}
module_exit(foo_exit);

Is it worth creating a generic helper macro to handle this boilerplate?
Something along the lines of the module_driver() macro. Each use would
replace about 10 lines-of-code with a single line.

If so what would be a good name for the macro and what header would
be the appropriate place for it to reside?

Thanks for any replies!
Hartley

