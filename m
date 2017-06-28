From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 28 Jun 2017 16:22:02 +0000
Subject: Re: [PATCH] rsi: add in missing RSI_FSM_STATES into array fsm_state
Message-Id: <87vangqdzp.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170622165804.24379-1-colin.king@canonical.com>
In-Reply-To: <20170622165804.24379-1-colin.king@canonical.com> (Colin King's
        message of "Thu, 22 Jun 2017 17:58:04 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> Two recent commits added new RSI_FSM_STATES (namely FSM_FW_NOT_LOADED
> and FSM_COMMON_DEV_PARAMS_SENT) and the corresponding table fsm_state
> was not updated to match. This can lead to an array overrun when
> accessing the latter two states in fsm_state. Fix this by adding in
> the missing states.
>
> Detected by CoverityScan, CID#1398379 ("Illegal address computation")
>
> Fixes: 9920322ccd8e04 ("rsi: add tx frame for common device configuration")
> Fixes: 015e367494c1d5 ("rsi: Register interrupt handler before firmware load")

This is very much nitpicking, no need to resend because of this, but the
preferred format is to to use 12 chars for the commit id:

Fixes: 9920322ccd8e ("rsi: add tx frame for common device configuration")
Fixes: 015e367494c1 ("rsi: Register interrupt handler before firmware load")

Documentation/process/submitting-patches.rst contains a nice tip how you
can get that automatically with git:

        [core]
                abbrev = 12
        [pretty]
                fixes = Fixes: %h (\"%s\")

-- 
Kalle Valo
