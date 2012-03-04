From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Sun, 04 Mar 2012 13:53:30 +0000
Subject: [media] dvb: Buffer Overfolow in cx24110_set_fec
Message-Id: <CAOD=uF4+UZ7Lr=RkvV-zpy4wOSCCM+RXDBHeqUf60fOzYH9EFw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@infradead.org
Cc: lucas.demarchi@profusion.mobi, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

I am getting following error:

"drivers/media/dvb/frontends/cx24110.c:210 cx24110_set_fec() error:
buffer overflow 'rate' 7 <= 8"

 In cx24110_set_fec, arrays " rate[] , g1[], g2[]"  have only 7 values.


typedef enum fe_code_rate {
        ........
        FEC_6_7,   // index 7
        FEC_7_8,   // index 8
        FEC_8_9,
        FEC_AUTO,
         .....
          ....
} fe_code_rate_t;


For     "FEC_6_7 <  fec  <  FEC_AUTO"  , rate[fec]. g1[fec], g2[fec]
values are not defined initially.
Is it expected or bug ?


regards
Santosh
