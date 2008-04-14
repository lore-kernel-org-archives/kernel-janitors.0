From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Mon, 14 Apr 2008 19:38:27 +0000
Subject: cli()/sti() removal
Message-Id: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Looking at Documentation/cli-sti-removal.txt and grepping for these
macros in the kernel tree reveal that things are close to allowing
this task to be completed. I would like to propose that the remainder
of this work be completed, cleaning up documentation and code related
to this deprecation. I am willing to do the work but just wanted to
put a feeler out there to determine if there is any reason not to
proceed. I also wanted to make sure there wasn't anyone else doing
this already.

Regards,
M. Asselstine
