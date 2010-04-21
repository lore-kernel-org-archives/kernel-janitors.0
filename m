From: David Howells <dhowells@redhat.com>
Date: Wed, 21 Apr 2010 10:54:13 +0000
Subject: Re: [patch] afs: passing an ERR_PTR() to page_cache_release()
Message-Id: <23222.1271847253@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100421103250.GE29647@bicker>
In-Reply-To: <20100421103250.GE29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <error27@gmail.com> wrote:

> In the error handling we try to release "page" if it's not NULL.

A better way to do this is to add another goto label and skip that bit of the
error handling.

David
