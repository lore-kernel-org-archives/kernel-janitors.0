From: Kees Cook <kees@outflux.net>
Date: Fri, 30 Dec 2005 00:04:00 +0000
Subject: [KJ] adding missing MODULE_* stuffs
Message-Id: <20051230000400.GS18040@outflux.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52135019763482116=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52135019763482116==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Would patches towards adding missing MODULE_DESCRIPTION, MODULE_VERSION, 
and MODULE_AUTHOR stuff be taken?  While these aren't covered in the 
CodingStyle document, I did find reference to their preferred order in 
Documentation/i2c/porting-clients.txt where Greg KH said the order 
should be:

MODULE_AUTHOR
MODULE_DESCRIPTION
MODULE_LICENSE /* last line of source */

I'm curious where MODULE_VERSION should go, as well as 
MODULE_PARAM_DESC.

Notably, AUTHOR, DESCRIPTION, and VERSION seem to be missing from the 
various examples in Documention/

-- 
Kees Cook                                            @outflux.net

--===============52135019763482116==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52135019763482116==--
