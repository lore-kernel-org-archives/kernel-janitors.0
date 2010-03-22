From: David Teigland <teigland@redhat.com>
Date: Mon, 22 Mar 2010 13:50:11 +0000
Subject: Re: [patch] dlm: cleanup remove unused code
Message-Id: <20100322135011.GA29680@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100322120354.GB21571@bicker>
In-Reply-To: <20100322120354.GB21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Christine Caulfield <ccaulfie@redhat.com>, Steven Whitehouse <swhiteho@redhat.com>, cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 22, 2010 at 03:03:54PM +0300, Dan Carpenter wrote:
> Smatch complains because "lkb" is never NULL.  Looking at it, the original
> code actually adds the new element to the end of the list fine, so we can
> just get rid of the if condition.  This code is four years old and no one
> has complained so it must work.

Thanks, queued for the next pull.
Dave

