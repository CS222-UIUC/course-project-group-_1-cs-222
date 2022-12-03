<table>
  <thead>
    <tr>
      {fields.map((field) => (
        <th key={field.name}>{field.label}</th>
      ))}
    </tr>
  </thead>
  <tbody>
    {records.length > 0 &&
      records.slice(0, shownRecordsCount).map((record: Record) => (
        <tr key={record.id}>
          {fields.map((field) => (
            <td key={field.name}>
              {field.name === "lat_lng"
                ? JSON.stringify(record[field.name])
                : record[field.name] || "-"}
            </td>
          ))}
        </tr>
      ))}
  </tbody>
</table>
{records.length && shownRecordsCount <= records.length ? (
  <button
    type="button"
    onClick={(_evt) =>
      setShownRecordsCount((current) => current + SHOWN_RECORDS_LIMIT)
    }
  >
    Load {SHOWN_RECORDS_LIMIT} More Records
  </button>
) : null}