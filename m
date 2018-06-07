From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Jun 2018 08:31:10 +0000
Subject: [PATCH] tools: iio: iio_generic_buffer: allow infinite looping
Message-Id: <20180607083110.gjfmdfuzw2my6sl5@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Martin Kelly <mkelly@xevo.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

I think the num_loops variable was intended to be signed so that we
could set it to -1 and it would loop forever.  Right now it just loops
for a very long time.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/tools/iio/iio_generic_buffer.c b/tools/iio/iio_generic_buffer.c
index 3040830d7797..84545666a09c 100644
--- a/tools/iio/iio_generic_buffer.c
+++ b/tools/iio/iio_generic_buffer.c
@@ -330,7 +330,7 @@ static const struct option longopts[] = {
 
 int main(int argc, char **argv)
 {
-	unsigned long long num_loops = 2;
+	long long num_loops = 2;
 	unsigned long timedelay = 1000000;
 	unsigned long buf_len = 128;
 
