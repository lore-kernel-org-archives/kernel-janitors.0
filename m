From: Jarod Wilson <jarod@redhat.com>
Date: Mon, 14 Mar 2011 20:03:35 +0000
Subject: Re: [patch 2/2] Staging: crystalhd: don't waste the last char of
Message-Id: <20110314200335.GB23071@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110314093531.GM2008@bicker>
In-Reply-To: <20110314093531.GM2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Mar 14, 2011 at 12:35:31PM +0300, Dan Carpenter wrote:
> pinfo->name is a 32 char buffer.  In the original code, the last char
> wasn't fully utilized.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Jarod Wilson <jarod@redhat.com>


-- 
Jarod Wilson
jarod@redhat.com

