From: David Howells <dhowells@redhat.com>
Date: Tue, 02 Jun 2020 15:57:34 +0000
Subject: Re: [PATCH][next] afs: fix double kfree on cell_name on error exit path
Message-Id: <1504660.1591113454@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200602153505.64714-1-colin.king@canonical.com>
In-Reply-To: <20200602153505.64714-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The error exit path is currently kfree'ing cell_name for a second time,
> the previous kfree of this object occurred a statement earlier. Fix this
> by removing it.
> 
> Addresses-Coverity: ("Double free")
> Fixes: 6147fe6b7f8c ("afs: Detect cell aliases 3 - YFS Cells with a canonical cell name op")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

I've folded it in, thanks.

David
