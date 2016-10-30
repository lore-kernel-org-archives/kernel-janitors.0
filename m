From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 30 Oct 2016 15:17:22 +0000
Subject: Re: scripts/basic/fixdep: Complete error handling in print_cmdline()
Message-Id: <5e73f504-fae2-c1c9-0dea-c2860cc4a683@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
 <d4bd9a09-d413-a073-c2d5-67933d425b87@users.sourceforge.net>
 <CA+r1ZhhoPy4mNwEtLVMqpXqotKuWmUf-D50=XWpWghzdtzTfEQ@mail.gmail.com>
In-Reply-To: <CA+r1ZhhoPy4mNwEtLVMqpXqotKuWmUf-D50=XWpWghzdtzTfEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Davis <jim.epost@gmail.com>, linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> But what would you expect printf error checking to tell a user?

I wonder that the error detection and corresponding exception handling
was not corrected for the affected source files of build-time tools so far.
https://www.securecoding.cert.org/confluence/display/c/EXP12-C.+Do+not+ignore+values+returned+by+functions

Regards,
Markus
