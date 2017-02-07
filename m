From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 07 Feb 2017 14:01:23 +0000
Subject: Re: [patch] Staging: bcm2835-audio: fix an uninitialized return value
Message-Id: <CAK8P3a2bPJGzcwAyoc0sT+jG-p8Z-4BfavH1UkcyvDQc5MUXjw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207131734.GC27416@mwanda>
In-Reply-To: <20170207131734.GC27416@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 7, 2017 at 2:17 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> "ret" isn't necessarily initialized on the success path.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

The patch seems correct, but do you have any idea why gcc-7 didn't
warn about this?
I assume that you found it with smatch, and nobody else did.

     Arnd
