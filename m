From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Mon, 21 Feb 2011 17:32:30 +0000
Subject: Re: [PATCH 3/3] Staging: xgifb: Remove unused function fbcon_XGI_sync
Message-Id: <AANLkTi=oxUNXwYtdCFOsc1ge+qfP+X+Ffjok=0nZ_YUr@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1298279347-8825-4-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1298279347-8825-4-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

>> -     .fb_sync = fbcon_XGI_sync,
>> +     .fb_sync = NULL,
>
> It doesn't need to be set explicitly.  It gets initialized to NULL
> automatically by default.
>

Ok, will resend a new version that just deletes it. Thank you.

Best regards,

-- 
-----------------------------------------
Javier Martínez Canillas
(+34) 682 39 81 69
PhD Student in High Performance Computing
Computer Architecture and Operating System Department (CAOS)
Universitat Autònoma de Barcelona
Barcelona, Spain
