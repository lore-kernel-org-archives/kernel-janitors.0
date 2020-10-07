From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Wed, 07 Oct 2020 16:49:50 +0000
Subject: Re: [PATCH] ima: Fix sizeof mismatches
Message-Id: <20201007164950.GA3885@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201007110243.19033-1-colin.king@canonical.com>
In-Reply-To: <20201007110243.19033-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, Roberto Sassu <roberto.sassu@polito.it>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 07, 2020 at 12:02:43PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> An incorrect sizeof is being used, sizeof(*fields) is not correct,
> it should be sizeof(**fields). This is not causing a problem since
> the size of these is the same. Fix this in the kmalloc_array and
> memcpy calls.
> 
> Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
> Fixes: 1bd7face7439 ("ima: allocate field pointers array on demand in template_desc_init_fields()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko
