From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 31 Dec 2010 13:23:44 +0000
Subject: Re: [PATCH 2/4] staging: keucr: Use strncpy() instead of custom
Message-Id: <AANLkTik0EYmBapec528ABHrpFigfMHoQeHD9DOMdhNPv@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1293787164-7056-3-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1293787164-7056-3-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Fri, Dec 31, 2010 at 11:17 AM, Dan Carpenter <error27@gmail.com> wrote:
> In the original code the StringCopy() function was equivalent to
> memcpy().  I don't know if the source string (which is probably not an
> actual string with this code) had NULL characters but if it did, that
> could cause bugs.
>
> regards,
> dan carpenter
>
>

Thank you for the review. I will prepare a new set of patches based in
your recommendations and resend.

-- 
Best regards,

-----------------------------------------
Javier Martínez Canillas
(+34) 682 39 81 69
