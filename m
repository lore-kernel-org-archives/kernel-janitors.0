From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 20:03:32 +0000
Subject: Re: pstore: Improve a size determination in three functions
Message-Id: <713573fc-52e8-d7a0-f4c0-2ce514dd1d1f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97737d95-d6aa-d24f-1af0-9d4895ceaed2@users.sourceforge.net>
 <23798ef4-5559-3454-ecf4-e6844b644ff3@users.sourceforge.net>
 <CAGXu5jLdTHJB576tqhpPZb_cV0B4zMnSAVkG=DzTN-dT51iAsw@mail.gmail.com>
In-Reply-To: <CAGXu5jLdTHJB576tqhpPZb_cV0B4zMnSAVkG=DzTN-dT51iAsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> Which script detected this?

* checkpatch.pl

* The following approach for the semantic patch language.

@replacement@
identifier action, var, work;
statement s1, s2;
statement list sl;
type T, X;
@@
 T work(...)
 {
 ... when any
 X* var;
 ... when any
 var = action(...,
              sizeof(
-                    X
+                    *var
                    ),
              ...
             )
 ... when any
 }

