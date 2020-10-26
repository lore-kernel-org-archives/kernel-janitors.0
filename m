From: Jakub Kicinski <kuba@kernel.org>
Date: Mon, 26 Oct 2020 18:37:05 +0000
Subject: Re: [PATCH] vsock: ratelimit unknown ioctl error message
Message-Id: <20201026113705.0cbad1d4@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023122113.35517-1-colin.king@canonical.com>
        <20201023140947.kurglnklaqteovkp@steredhat>
        <e535c07df407444880d8b678bc215d9f@AcuMS.aculab.com>
        <20201026084300.5ag24vck3zeb4mcz@steredhat>
        <d893e3251f804cffa797b6eb814944fd@AcuMS.aculab.com>
        <20201026093917.5zgginii65pq6ezd@steredhat>
        <3e34e4121f794355891fd7577c9dfbc0@AcuMS.aculab.com>
        <20201026100112.qaorff6c6vucakyg@steredhat>
        <20201026105548.0cc911a8@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
        <20201026182457.fy6uxrjgs5bpzmnr@steredhat>
In-Reply-To: <20201026182457.fy6uxrjgs5bpzmnr@steredhat>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Colin King <colin.king@canonical.com>, David Laight <David.Laight@aculab.com>, "David S . Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, 26 Oct 2020 19:24:57 +0100 Stefano Garzarella wrote:
> @Colin, can you send a v2 removing the error message and updating the 
> return value?

Not as a single patch, please, these are two different changes.
