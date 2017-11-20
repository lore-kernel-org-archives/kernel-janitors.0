From: David Howells <dhowells@redhat.com>
Date: Mon, 20 Nov 2017 22:20:21 +0000
Subject: Re: [PATCH] afs: remove redundant assignment of dvnode to itself
Message-Id: <27271.1511216421@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171120135820.32596-1-colin.king@canonical.com>
In-Reply-To: <20171120135820.32596-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment of dvnode to itself is redundant and can be removed.
> Cleans up warning detected by cppcheck:
> 
> fs/afs/dir.c:975: (warning) Redundant assignment of 'dvnode' to itself.
> 
> Fixes: d2ddc776a458 ("afs: Overhaul volume and server record caching and fileserver rotation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.

David
