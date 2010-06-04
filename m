From: David Howells <dhowells@redhat.com>
Date: Fri, 04 Jun 2010 10:08:06 +0000
Subject: Re: [patch] KEYS: Propagate error code instead of returning -EINVAL
Message-Id: <23225.1275646086@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100603190911.GX5483@bicker>
In-Reply-To: <20100603190911.GX5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <error27@gmail.com> wrote:

> This is from a Smatch check I'm writing.
> 
> strncpy_from_user() returns -EFAULT on error so the first change just
> silences a warning but doesn't change how the code works.
> 
> The other change is a bug fix because install_thread_keyring_to_cred()
> can return a variety of errors such as -EINVAL, -EEXIST, -ENOMEM or 
> -EKEYREVOKED.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: David Howells <dhowells@redhat.com>
