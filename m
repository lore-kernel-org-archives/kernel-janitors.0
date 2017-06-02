From: David Howells <dhowells@redhat.com>
Date: Fri, 02 Jun 2017 21:37:44 +0000
Subject: Re: [PATCH][net-next] rxrpc: remove redundant proc_remove call
Message-Id: <21413.1496439464@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170602152227.3626-1-colin.king@canonical.com>
In-Reply-To: <20170602152227.3626-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: dhowells@redhat.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The proc_remove call is dead code as it occurs after a return and
> hence can never be called. Remove it.
> 
> Detected by CoverityScan, CID#1437743 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: David Howells <dhowells@redhat.com>
