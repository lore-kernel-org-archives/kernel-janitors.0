From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 06 Aug 2014 10:39:10 +0000
Subject: [PATCH 0/1] delete unnecessary null test on array
Message-Id: <1407321551-27479-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, "James E.J. Bottomley" <JBottomley@parallels.com>, Adaptec OEM Raid Solutions <aacraid@adaptec.com>

Delete NULL test on array.  The complete semantic patch that finds this
problem is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
type T;
T [] e;
position p;
@@

(
 e =@p NULL
|
 e !=@p NULL
|
 !@p e
)

@ disable fld_to_ptr@
expression e;
identifier f;
position r.p;
@@

(
* (e.f) =@p NULL
|
* (e.f) !=@p NULL
|
* !@p(e.f)
)
// </smpl>

For best results, this semantic patch requires lots of type information,
and should be used with the options --recursive-includes and
--relax-include-path.  This may take a long time to run.

