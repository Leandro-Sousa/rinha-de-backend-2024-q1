PRAGMA journal_mode=WAL;
PRAGMA synchronous=OFF;

CREATE TABLE IF NOT EXISTS customers
(
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS balances
(
    customer_id INTEGER NOT NULL PRIMARY KEY,
    "limit" INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    CONSTRAINT fk_balances_customers FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE IF NOT EXISTS transactions
(
    customer_id INTEGER NOT NULL,
    "type" CHAR(1) NOT NULL,
    amount INTEGER NOT NULL,
    description VARCHAR(10) NOT NULL,
    created_at BIGINT NOT NULL,
    CONSTRAINT fk_transactions_customers FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE INDEX IF NOT EXISTS IX_transactions_customer_id ON transactions(customer_id);

INSERT OR IGNORE INTO customers VALUES(1, 'Mario Bros'    );
INSERT OR IGNORE INTO customers VALUES(2, 'Luigi Bros'    );
INSERT OR IGNORE INTO customers VALUES(3, 'Peach Princess');
INSERT OR IGNORE INTO customers VALUES(4, 'Bowser'        );
INSERT OR IGNORE INTO customers VALUES(5, 'Yoshi'         );

INSERT OR IGNORE INTO balances VALUES(1,   100000, 0);
INSERT OR IGNORE INTO balances VALUES(2,    80000, 0);
INSERT OR IGNORE INTO balances VALUES(3,  1000000, 0);
INSERT OR IGNORE INTO balances VALUES(4, 10000000, 0);
INSERT OR IGNORE INTO balances VALUES(5,   500000, 0);
