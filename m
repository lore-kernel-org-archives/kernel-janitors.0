From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sat, 30 Oct 2010 09:06:44 +0000
Subject: Re: [PATCH] ipc: shm: fix information leak to userland
Message-Id: <20101030090644.GX19804@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288429477-21920-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288429477-21920-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>, David Howells <dhowells@redhat.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org

On Sat, Oct 30, 2010 at 01:04:37PM +0400, Vasiliy Kulikov wrote:
> Structure shmid_ds is copied to userland with shm_unused{,2,3}
> fields unitialized.  It leads to leaking of contents of kernel stack memory.
 
ACK; send to Linus and add Cc: stable@kernel.org
