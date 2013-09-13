From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 13 Sep 2013 17:00:55 +0000
Subject: Re: [patch 1/4] skd: use regular version of copy_from_user()
Message-Id: <523344C7.60303@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130913075523.GE19211@elgon.mountain>
In-Reply-To: <20130913075523.GE19211@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jeff Moyer <jmoyer@redhat.com>, Ramprasad Chinthekindi <rchinthekindi@stec-inc.com>, Akhil Bhansali <abhansali@stec-inc.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09/13/2013 01:55 AM, Dan Carpenter wrote:
> The other __copy_from_user() calls have access_ok() checks so they are
> fine, but these two don't have the check.

Thanks Dan, applied this one and the other two. Did you miss sending one
out? I don't see a 3/4 patch.

-- 
Jens Axboe

