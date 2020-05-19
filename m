From: David Howells <dhowells@redhat.com>
Date: Tue, 19 May 2020 16:15:35 +0000
Subject: Re: [PATCH][next] fsinfo: fix an uninialized variable 'conn'
Message-Id: <1514050.1589904935@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200514181926.16571-1-colin.king@canonical.com>
In-Reply-To: <20200514181926.16571-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: dhowells@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable conn is not initialized and can potentially contain
> garbage causing a false -EPERM return on the !conn check.
> Fix this by initializing it to false.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: f2494de388bd ("fsinfo: Add an attribute that lists all the visible mounts in a namespace")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, I've folded that in.

David
