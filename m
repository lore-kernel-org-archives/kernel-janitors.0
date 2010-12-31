From: Dan Carpenter <error27@gmail.com>
Date: Fri, 31 Dec 2010 10:17:51 +0000
Subject: Re: [PATCH 2/4] staging: keucr: Use strncpy() instead of custom
Message-Id: <20101231101751.GE1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1293787164-7056-3-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1293787164-7056-3-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In the original code the StringCopy() function was equivalent to
memcpy().  I don't know if the source string (which is probably not an
actual string with this code) had NULL characters but if it did, that
could cause bugs.

regards,
dan carpenter

