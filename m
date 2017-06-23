From: Tahsin Erdogan <tahsin@google.com>
Date: Fri, 23 Jun 2017 17:04:32 +0000
Subject: Re: [PATCH][ext4-next] ext4: ensure error return ret is zero on successful return
Message-Id: <CAAeU0aMtbRBN80fhPza4QS-77Mn=KAPO8STt__tq8UjtQuuk2Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623145840.26779-1-colin.king@canonical.com>
In-Reply-To: <20170623145840.26779-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jun 23, 2017 at 7:58 AM, Colin King <colin.king@canonical.com> wrote:
> The error return ret is not set on a successful return path and
> so it returns a garbage value. Ensure it is is set to zero on
> a successful return.
Thanks for catching this bug!

Reviewed-by: Tahsin Erdogan <tahsin@google.com>
