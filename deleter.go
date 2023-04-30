package main

import (
	"fmt"
	"io/fs"
	"log"
	"os"
	"path/filepath"
	"strings"
)

func main() {
	err := filepath.Walk("./public", func(path string, info fs.FileInfo, err error) error {
		if strings.HasSuffix(path, ".gmr") || strings.HasSuffix(path, ".gmr.hash") {
			err := os.Remove(path)
			if err != nil {
				return fmt.Errorf("can't remove file: %w", err)
			}
		}
		return nil
	})
	if err != nil {
		log.Fatalf("can't walk files: %s", err)
	}
}
