From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 17 Oct 2016 12:50:57 +0000
Subject: Re: ARM64-cpuinfo: Combine six calls for sequence output into one seq_printf() call in c_show()
Message-Id: <d012ad47-9688-5c9c-6ffd-78300c7b21ae@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <83d98772-8872-1b75-a9a5-5f08b8462e18@users.sourceforge.net>
 <20161017105605.GB29095@leverpostej>
 <a09542e6-9851-45ef-583d-338205217cfc@users.sourceforge.net>
 <20161017123726.GE29095@leverpostej>
In-Reply-To: <20161017123726.GE29095@leverpostej>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

> I prefer the code as-is. Unless there's a compelling reason to change it.

Is the chance for faster log output interesting enough?

Regards,
Markus
