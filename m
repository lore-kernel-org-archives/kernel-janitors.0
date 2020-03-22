From: Jiri Kosina <jikos@kernel.org>
Date: Sun, 22 Mar 2020 23:10:08 +0000
Subject: Re: [PATCH] HID: rmi: Simplify an error handling path in 'rmi_hid_read_block()'
Message-Id: <nycvar.YFH.7.76.2003230009590.19500@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200321064048.15768-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200321064048.15768-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 21 Mar 2020, Christophe JAILLET wrote:

> The 'RMI_READ_REQUEST_PENDING' bit is already cleared in the error 
> handling path. There is no need to reset it twice.

Good catch. Applied, thanks.

-- 
Jiri Kosina
SUSE Labs
