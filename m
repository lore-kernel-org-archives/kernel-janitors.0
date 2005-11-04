From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 04 Nov 2005 21:58:55 +0000
Subject: [KJ] CSS conversion merged
Message-Id: <20051104215855.GA9905@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30282218726811583=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============30282218726811583==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've merged Michael's and Jerome's changes to kerneljanitors.org CSS.
Looks OK in Firefox and links. Please go to http://kerneljanitors.org/
and see if long dashes are OK.

We have two CSS now: "kerneljanitors.org" and "kernel.org". The former
is left the default one.

CSS validator shows 5 warnings. Dunno if they are serious.

During merge yours truly discovered one cool Firefox feature and 2 bugs
in it. That's why 2 commits.

----------------------------
revision 1.18
date: 2005/11/04 21:25:54;  author: dobriyan;  state: Exp;  lines: +2 -2
Fix alternate CSS screwup.

Firefox somehow doesn't like if default CSS doesn't have title="..." and makes
alternate CSS looks ugly. :-(
----------------------------
revision 1.17
date: 2005/11/03 23:02:36;  author: dobriyan;  state: Exp;  lines: +55 -75
Merge of total CSS conversion from Michael Veeck.
----------------------------


--===============30282218726811583==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30282218726811583==--
