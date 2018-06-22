From: David Howells <dhowells@redhat.com>
Date: Fri, 22 Jun 2018 12:35:04 +0000
Subject: Re: [PATCH -next] mqueue: fix a typo in mq_init_ns()
Message-Id: <28835.1529670904@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1529546567-74814-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1529546567-74814-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: dhowells@redhat.com, Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, "Eric W. Biederman" <ebiederm@xmission.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Fix a typo, use 'm' instead of 'ns->mq_mnt'.

I've folded this into the original patch, thanks.

David
