From: Joe Perches <joe@perches.com>
Date: Sun, 19 Aug 2007 22:17:44 +0000
Subject: convert #include "linux/..." to #include <linux/...> [PATCH]s
Message-Id: <1187561864.4200.136.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@shadowen.org>

There are several files that:

#include "linux/file" not #include <linux/file>
#include "asm/file" not #include <asm/file>

Here's a little script that converts them:

egrep -i -r -l --include=*.[ch] \
"^[[:space:]]*\#[[:space:]]*include[[:space:]]*\"(linux|asm)/(.*)\"" * \
| xargs sed -i -e 's/^[[:space:]]*#[[:space:]]*include[[:space:]]*"\(linux\|asm\)\/\(.*\)"/#include <\1\/\2>/g'

Maybe a similar check could be added to checkpatch.pl

