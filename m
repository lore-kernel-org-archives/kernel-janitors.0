From: David Howells <dhowells@redhat.com>
Date: Mon, 22 Mar 2010 13:05:24 +0000
Subject: Re: [patch] afs: potential null dereference
Message-Id: <12814.1269263124@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100322125626.GM21571@bicker> <20100320111938.GT5331@bicker> <28809.1269259520@redhat.com>
In-Reply-To: <20100322125626.GM21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: dhowells@redhat.com, kernel-janitors@vger.kernel.org, linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org

Dan Carpenter <error27@gmail.com> wrote:

> I was concerned about the dereference here:
> 
> +       if (xpermits)
> +               memcpy(permits->permits, xpermits->permits,
>                                          ^^^^^^^^^^^^^^^^^
> +                       count * sizeof(struct afs_permit));

That's a good point - in which case your patch should definitely go in.

David
