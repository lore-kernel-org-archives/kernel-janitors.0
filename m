From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 26 Jun 2018 15:18:29 +0000
Subject: re: mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver
Message-Id: <993e40ac-1f06-c2ee-e9fb-4523df368cb7@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi there,

Static analysis with CoverityScan reported a potential issue with the
following commit:

commit 0f7b126ca91101d02d525f7cc880e8c71202a2b7
Author: Stefan Agner <stefan@agner.ch>
Date:   Sun Jun 24 23:27:25 2018 +0200

    mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver


in function tegra_nand_cmd it looks like there maybe potential to pass a
negative value in size into memcpy():

        case NAND_OP_DATA_OUT_INSTR:

negative_return_fn: Function nand_subop_get_data_len(subop, op_id)
returns a negative number.

var_assign: Assigning: unsigned variable size = nand_subop_get_data_len.

                size = nand_subop_get_data_len(subop, op_id);
                offset = nand_subop_get_data_start_off(subop, op_id);

                cmd |= COMMAND_TRANS_SIZE(size) | COMMAND_PIO |
                        COMMAND_TX | COMMAND_A_VALID;

Argument cannot be negative (NEGATIVE_RETURNS)65. negative_returns: size
is passed to a parameter that cannot be negative.
                memcpy(&reg, instr->ctx.data.buf.out + offset, size);


I also think the same issue may be happening with the
NAND_OP_DATA_IN_INSTR case too.

Colin
