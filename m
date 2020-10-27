From: Colin King <colin.king@canonical.com>
Date: Tue, 27 Oct 2020 09:09:40 +0000
Subject: [PATCH 0/2] vsock: minor clean up of ioctl error handling
Message-Id: <20201027090942.14916-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Stefano Garzarella <sgarzare@redhat.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Two minor changes to the ioctl error handling.

Colin Ian King (2):
  vsock: remove ratelimit unknown ioctl message
  vsock: fix the error return when an invalid ioctl command is used

 net/vmw_vsock/af_vsock.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.27.0
