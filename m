From: Stefan Sperling <stefan@binarchy.net>
Date: Sun, 07 Nov 2004 21:22:09 +0000
Subject: [KJ] how can I declare a char[][] module parameter?
Message-Id: <20041107212209.GA11291@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49374735656282365=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49374735656282365==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I have asked this question on IRC, but got no response.
So I ask my question here.

I am currently converting the wireless drivers in
drivers/net/wireless/ to the new module parameter declaring scheme.

So far there were no problems.
The following parameter declaration is giving me headaches, though:

(from drivers/net/wireless/wavelan.p.h):

    static char	name[4][IFNAMSIZ];
    MODULE_PARM(name, "1-4c" __MODULE_STRING(IFNAMSIZ));

Note:  __MODULE_STRING(IFNAMSIZ) expands to '"16"'

This is the best conversion I came up with, but it discards information:

    module_param_array(name, charp, WAVELAN_P_NAME_LEN, 0444);

How can I declare an array of char*, without loosing the
information that each char* points to a buffer of IFNAMESIZ bytes?
Do I need to declare a custom parameter type?

Thanks
stefan
-- 
Give me a fish and I will eat today.
Teach me to fish and I will eat forever.

--===============49374735656282365==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49374735656282365==--
